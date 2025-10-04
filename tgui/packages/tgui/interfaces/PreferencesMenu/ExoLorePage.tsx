// EXOSTATION TGUI FILE

import { Box, LabeledList, Section, Stack } from 'tgui-core/components';

import { useBackend } from '../../backend';
import { PreferenceSingle } from './ExoSinglePreference';
import type { PreferencesMenuData } from './types';

export const LorePage = () => {
  const { act, data } = useBackend<PreferencesMenuData>();
  const CHAR_LOREPreferences = {
    ...data.character_preferences.exo_lore,
  };
  return (
    <Box className="PreferencesMenu__Lore">
      <Stack.Item
        basis="50%"
        grow
        style={{
          background: 'rgba(0, 0, 0, 0.5)',
          padding: '4px',
        }}
        overflowX="hidden"
        overflowY="auto"
        maxHeight="auto"
      >
        <LabeledList>
          <Section title="Carbon Character Details">
            <PreferenceSingle
              pref_key="age"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="age_chronological"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="flavor_short_desc"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="flavor_extended_desc"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="headshot_url"
              preferences={CHAR_LOREPreferences}
            />
          </Section>
          <Section title="Silicon Character details">
            <PreferenceSingle
              pref_key="silicon_flavor_short_desc"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="silicon_flavor_extended_desc"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="silicon_headshot_url"
              preferences={CHAR_LOREPreferences}
            />
          </Section>
          <Section title="Records">
            <PreferenceSingle
              pref_key="past_general_records"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="past_medical_records"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="past_security_records"
              preferences={CHAR_LOREPreferences}
            />
            <PreferenceSingle
              pref_key="exploitable_records"
              preferences={CHAR_LOREPreferences}
            />
          </Section>
          <Section title="Notes">
            <PreferenceSingle
              pref_key="ooc_notes"
              preferences={CHAR_LOREPreferences}
            />
          </Section>
        </LabeledList>
      </Stack.Item>
    </Box>
  );
};
