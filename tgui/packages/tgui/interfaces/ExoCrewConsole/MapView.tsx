// FICHIER TGUI EXOSTATION
import { useState } from 'react';
import { LabeledList, Section } from 'tgui-core/components';

import { useBackend } from '../../backend';
import { NanoMap } from '../common/ExoNanoMap';
import {
  HEALTH_COLOR_BY_LEVEL,
  healthToAttribute,
  jobIsHead,
  STAT_DEAD,
} from './constants';
import { HealthStat } from './HealthStat';
import type { CrewConsoleData } from './types';

export function MapView(props) {
  const { act, data } = useBackend<CrewConsoleData>();
  const { mapData, sensors } = data;
  const {
    highlight,
    sorted_sensors,
    highlightedSensors,
    searchText,
    headsOnly,
  } = props;
  const [selectedLevel, setSelectedLevel] = useState<number>(mapData.mainFloor);

  return (
    <NanoMap
      mapData={mapData}
      uiName="crew-console"
      onLevelChange={setSelectedLevel}
    >
      {sensors.map(
        (sensor) =>
          sensor.position?.area !== '~' &&
          sensor.position?.area !== undefined && (
            <NanoMap.Marker
              key={sensor.ref}
              posX={sensor.position?.x}
              posY={sensor.position?.y}
              color={healthToAttribute(sensor, HEALTH_COLOR_BY_LEVEL)}
              icon={sensor.life_status === STAT_DEAD && 'skull'}
              tooltip={<CrewMapTooltip sensor_data={sensor} />}
              hidden={
                sensor.position?.z !== selectedLevel ||
                (headsOnly && !jobIsHead(sensor.ijob))
              }
              selected={searchText && sorted_sensors.includes(sensor)}
              highlighted={highlightedSensors.includes(sensor.name)}
              onClick={() => highlight(sensor.name)}
              onContextMenu={(event) => {
                if (props.disabled) {
                  return;
                }

                event.preventDefault();
                act('select_person', {
                  name: sensor.name,
                });
              }}
            />
          ),
      )}
    </NanoMap>
  );
}

const CrewMapTooltip = (props) => {
  const { sensor_data } = props;
  const position = sensor_data.position;
  return (
    <Section
      m={-1}
      title={`${sensor_data.name} (${sensor_data.assignment})`}
      fontSize={0.9}
    >
      <LabeledList>
        <LabeledList.Item
          label="Statut"
          color={sensor_data.life_status === STAT_DEAD ? '#e74c3c' : '#17d568'}
        >
          {sensor_data.life_status === STAT_DEAD ? 'Mort' : 'Vivant'}
        </LabeledList.Item>
        <LabeledList.Item label="Santé">
          <HealthStat sensor_data={sensor_data} />
        </LabeledList.Item>
        <LabeledList.Item label="Emplacement">
          {position?.area}
        </LabeledList.Item>
        <LabeledList.Item label="Position">
          X: {position?.x}, Y: {position?.y}, Z: {position?.z}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
