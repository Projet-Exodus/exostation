import { type Feature, FeatureNumberInput } from '../base';

export const age: Feature<number> = {
  name: 'Age',
  /* EXOSTATION EDIT ADDITION START - EXOLORE */
  description:
    "The character's physical age, in years.  This is the age their body should be, ignoring any type of stasis or time manipulation.",
  /* EXOSTATION EDIT ADDITION END - EXOLORE */
  component: FeatureNumberInput,
};
