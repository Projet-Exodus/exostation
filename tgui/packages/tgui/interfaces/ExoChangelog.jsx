// FICHIER INTERFACE EXODUS - EXO_CHANGELOG

import dateformat from 'dateformat';
import yaml from 'js-yaml';
import { Component, Fragment } from 'react';
import {
  Box,
  Button,
  Dropdown,
  Icon,
  Section,
  Stack,
  Table,
} from 'tgui-core/components';
import { classes } from 'tgui-core/react';

import { resolveAsset } from '../assets';
import { useBackend } from '../backend';
import { Window } from '../layouts';

const icons = {
  add: { icon: 'check-circle', color: 'green' },
  admin: { icon: 'user-shield', color: 'purple' },
  balance: { icon: 'balance-scale-right', color: 'yellow' },
  bugfix: { icon: 'bug', color: 'green' },
  code_imp: { icon: 'code', color: 'green' },
  config: { icon: 'cogs', color: 'purple' },
  expansion: { icon: 'check-circle', color: 'green' },
  experiment: { icon: 'radiation', color: 'yellow' },
  image: { icon: 'image', color: 'green' },
  imageadd: { icon: 'tg-image-plus', color: 'green' },
  imagedel: { icon: 'tg-image-minus', color: 'red' },
  qol: { icon: 'hand-holding-heart', color: 'green' },
  refactor: { icon: 'tools', color: 'green' },
  rscadd: { icon: 'check-circle', color: 'green' },
  rscdel: { icon: 'times-circle', color: 'red' },
  server: { icon: 'server', color: 'purple' },
  sound: { icon: 'volume-high', color: 'green' },
  soundadd: { icon: 'tg-sound-plus', color: 'green' },
  sounddel: { icon: 'tg-sound-minus', color: 'red' },
  spellcheck: { icon: 'spell-check', color: 'green' },
  map: { icon: 'map', color: 'green' },
  tgs: { icon: 'toolbox', color: 'purple' },
  tweak: { icon: 'wrench', color: 'green' },
  unknown: { icon: 'info-circle', color: 'label' },
  wip: { icon: 'hammer', color: 'orange' },
};

export class ExoChangelog extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: 'Loading changelog data...',
      selectedDate: '',
      selectedIndex: 0,
    };
    this.dateChoices = [];
  }

  setData(data) {
    this.setState({ data });
  }

  setSelectedDate(selectedDate) {
    this.setState({ selectedDate });
  }

  setSelectedIndex(selectedIndex) {
    this.setState({ selectedIndex });
  }

  getData = (date, attemptNumber = 1) => {
    const { act } = useBackend();
    const self = this;
    const maxAttempts = 6;

    if (attemptNumber > maxAttempts) {
      return this.setData(
        'Failed to load data after ' + maxAttempts + ' attempts',
      );
    }

    act('get_month', { date });

    fetch(resolveAsset(date + '.yml')).then(async (changelogData) => {
      const result = await changelogData.text();
      const errorRegex = /^Cannot find/;

      if (errorRegex.test(result)) {
        const timeout = 50 + attemptNumber * 50;

        self.setData('Loading changelog data' + '.'.repeat(attemptNumber + 3));
        setTimeout(() => {
          self.getData(date, attemptNumber + 1);
        }, timeout);
      } else {
        self.setData(yaml.load(result, { schema: yaml.CORE_SCHEMA }));
      }
    });
  };

  componentDidMount() {
    const {
      data: { dates = [] },
    } = useBackend();

    if (dates) {
      dates.forEach((date) =>
        this.dateChoices.push(dateformat(date, 'mmmm yyyy', true)),
      );
      this.setSelectedDate(this.dateChoices[0]);
      this.getData(dates[0]);
    }
  }

  render() {
    const { data, selectedDate, selectedIndex } = this.state;
    const {
      data: { dates },
    } = useBackend();
    const { dateChoices } = this;

    const dateDropdown = dateChoices.length > 0 && (
      <Stack mb={1}>
        <Stack.Item>
          <Button
            className="Changelog__Button"
            disabled={selectedIndex === 0}
            icon={'chevron-left'}
            onClick={() => {
              const index = selectedIndex - 1;

              this.setData('Loading changelog data...');
              this.setSelectedIndex(index);
              this.setSelectedDate(dateChoices[index]);
              window.scrollTo(
                0,
                document.body.scrollHeight ||
                  document.documentElement.scrollHeight,
              );
              return this.getData(dates[index]);
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Dropdown
            autoScroll={false}
            options={dateChoices}
            onSelected={(value) => {
              const index = dateChoices.indexOf(value);

              this.setData('Loading changelog data...');
              this.setSelectedIndex(index);
              this.setSelectedDate(value);
              window.scrollTo(
                0,
                document.body.scrollHeight ||
                  document.documentElement.scrollHeight,
              );
              return this.getData(dates[index]);
            }}
            selected={selectedDate}
            width="150px"
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            className="Changelog__Button"
            disabled={selectedIndex === dateChoices.length - 1}
            icon={'chevron-right'}
            onClick={() => {
              const index = selectedIndex + 1;

              this.setData('Loading changelog data...');
              this.setSelectedIndex(index);
              this.setSelectedDate(dateChoices[index]);
              window.scrollTo(
                0,
                document.body.scrollHeight ||
                  document.documentElement.scrollHeight,
              );
              return this.getData(dates[index]);
            }}
          />
        </Stack.Item>
      </Stack>
    );

    const header = (
      <Section>
        <h1>Exostation</h1>
        <p>
          <b>Spécificités : </b>
          Exostation est un downstream francophone de /tg/station orienté vers
          le roleplay (sans ERP) et la création d&apos;histoires, destiné à une
          population modeste et à des joueurs débutants. Nous avons reproduit
          des fonctionnalités communes à de nombreux downstreams de /tg/station
          et ajouté les nôtres.
        </p>
        <p>
          {'Les contributeurs GitHub les plus récents se trouvent '}
          <a href="https://github.com/Projet-Exodus/exostation/pulse/monthly">
            ici
          </a>
          .
        </p>
        <p>
          {'Vous trouverez aussi le lien de notre wiki '}
          <a href="https://exodus.thravalgur.ovh/exowiki/index.php/Accueil">
            ici
          </a>
          .
        </p>
        <p>
          <b>Remarque : </b>
          Ce changelog est un quasi-clone de celui de /tg/station, destiné à
          suivre les évolutions propres au serveur Exostaton. Le changelog de
          /TG/ peut être trouvé dans le menu Echap ou dans l&apos;onglet OOC
          avec le verbe /TG/ Changelog.
        </p>
        {dateDropdown}
      </Section>
    );

    const footer_tg = (
      <Section>
        <h1>Downstream de Traditional Games Space Station 13</h1>
        <p>
          <b>Remerciements : </b>
          Merci aux développeurs de Traditional Games Space Station 13
          (/tg/station). Merci également aux développeurs précédents de
          Baystation 12, /vg/station, NTstation, CDK Station, FacepunchStation,
          GoonStation, aux développeurs originels de Space Station 13. Merci
          enfin aux utilisateurs GitHub celotajstg pour l&apos;adaptation de ce
          changelog en TGUI et Invisty pour l&apos;image de titre, et aux
          innombrables autres qui ont contribué au jeu, au report des erreurs ou
          au wiki au fil des ans.
        </p>
        <p>
          {'Les membres actuels de leur organisation peuvent être trouvés '}
          <a href="https://github.com/orgs/tgstation/people">ici </a>
          {' et leurs derniers contributeurs GitHub '}
          <a href="https://github.com/tgstation/tgstation/pulse/monthly">
            {' '}
            ici
          </a>
          .
        </p>
        <p>
          <b>Remerciements aux autres downstreams : </b>
          Merci aux développeurs de BandaStation, Skyrat Station 13, Nova
          Sector, IrisStation, BubberStation, MappleStation, Orbstation,
          DopplerStation et TaleStation, ainsi que de tout autre downstream dont
          les idées ou le travail ont inspiré les développeurs d'Exostation.
        </p>
      </Section>
    );

    const footer_goon = (
      <Section>
        <h3>GoonStation 13 Development Team</h3>
        <p>
          <b>Coders: </b>
          Stuntwaffle, Showtime, Pantaloons, Nannek, Keelin, Exadv1, hobnob,
          Justicefries, 0staf, sniperchance, AngriestIBM, BrianOBlivion
        </p>
        <p>
          <b>Spriters: </b>
          Supernorn, Haruhi, Stuntwaffle, Pantaloons, Rho, SynthOrange, I Said
          No
        </p>
        <p>
          Avec Traditional Games Space Station 13, Exostation est aussi
          reconnaissant envers l&apos;équipe de développement de GoonStation 13
          pour son travail jusqu&apos;à la release
          {
            " r4407. Le changelog pour les changements jusqu'à r4407 peut être consulté "
          }
          <a href="https://wiki.ss13.co/Pre-2016_Changelog#April_2010">ici</a>.
        </p>
        <p>
          {'Sauf mention contraire, Goon Station 13 est sous licence '}
          <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/">
            Creative Commons Attribution-Noncommercial-Share Alike 3.0
          </a>
          {'. Les droits sont actuellement accordés à '}
          <a href="http://forums.somethingawful.com/">SomethingAwful Goons</a>
          {' exclusivement.'}
        </p>
        <h3>Licence pour Exodus et Traditional Games Space Station 13</h3>
        <p>
          {'Tout le code après le '}
          <a
            href={
              'https://github.com/tgstation/tgstation/commit/' +
              '333c566b88108de218d882840e61928a9b759d8f'
            }
          >
            commit 333c566b88108de218d882840e61928a9b759d8f du 2014/31/12 à 4:38
            PM PST
          </a>
          {' est sous licence '}
          <a href="https://www.gnu.org/licenses/agpl-3.0.html">GNU AGPL v3</a>
          {'. Tout le code avant ce commit est sous licence '}
          <a href="https://www.gnu.org/licenses/gpl-3.0.html">GNU GPL v3</a>
          {
            ', y compris les outils (tools), sauf indicaton contraire dans leur readme.md. Cf. les fichiers '
          }
          <a href="https://github.com/tgstation/tgstation/blob/master/LICENSE">
            LICENCE
          </a>
          {' et '}
          <a href="https://github.com/tgstation/tgstation/blob/master/GPLv3.txt">
            GPLv3.txt
          </a>
          {' pour plus de détails.'}
        </p>
        <p>
          Le sous-projet TGS DMAPI API est sous la licence MIT.
          {' Voir le bas de page de '}
          <a
            href={
              'https://github.com/tgstation/tgstation/blob/master' +
              '/code/__DEFINES/tgs.dm'
            }
          >
            code/__DEFINES/tgs.dm
          </a>
          {' et '}
          <a
            href={
              'https://github.com/tgstation/tgstation/blob/master' +
              '/code/modules/tgs/LICENSE'
            }
          >
            code/modules/tgs/LICENSE
          </a>
          {' pour la licence MIT.'}
        </p>
        <p>
          {'Tous les assets dont les icônes et le son sont sous une'}
          <a href="https://creativecommons.org/licenses/by-sa/3.0/">
            licence Creative Commons 3.0 BY-SA
          </a>
          {' sauf indication contraire.'}
        </p>
      </Section>
    );

    const changes =
      typeof data === 'object' &&
      Object.keys(data).length > 0 &&
      Object.entries(data)
        .reverse()
        .map(([date, authors]) => (
          <Section key={date} title={dateformat(date, 'd mmmm yyyy', true)}>
            <Box ml={3}>
              {Object.entries(authors).map(([name, changes]) => (
                <Fragment key={name}>
                  <h4>{name} changed:</h4>
                  <Box ml={3}>
                    <Table>
                      {changes.map((change) => {
                        const changeType = Object.keys(change)[0];
                        return (
                          <Table.Row key={changeType + change[changeType]}>
                            <Table.Cell
                              className={classes([
                                'Changelog__Cell',
                                'Changelog__Cell--Icon',
                              ])}
                            >
                              <Icon
                                color={
                                  icons[changeType]
                                    ? icons[changeType].color
                                    : icons['unknown'].color
                                }
                                name={
                                  icons[changeType]
                                    ? icons[changeType].icon
                                    : icons['unknown'].icon
                                }
                              />
                            </Table.Cell>
                            <Table.Cell className="Changelog__Cell">
                              {change[changeType]}
                            </Table.Cell>
                          </Table.Row>
                        );
                      })}
                    </Table>
                  </Box>
                </Fragment>
              ))}
            </Box>
          </Section>
        ));

    return (
      <Window title="Exostation Changelog" width={675} height={650}>
        <Window.Content scrollable>
          {header}
          {changes}
          {typeof data === 'string' && <p>{data}</p>}
          {footer_tg}
          {footer_goon}
        </Window.Content>
      </Window>
    );
  }
}
