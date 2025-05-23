export type Channel =
  | 'Say'
  | 'Radio'
  | 'Me'
  | 'Whis'
  | 'LOOC'
  | 'OOC'
  | 'Admin'; // EXOSTATION EDIT ADDITION - COM_VERBS : LOOC, Whis & prettier

/**
 * ### ChannelIterator
 * Cycles a predefined list of channels,
 * skipping over blacklisted ones,
 * and providing methods to manage and query the current channel.
 */
export class ChannelIterator {
  private index: number = 0;
  private readonly channels: Channel[] = [
    // EXOSTATION EDIT ADDITION START - COM_VERBS : LOOC, WHIS & prettier
    'Say',
    'Radio',
    'Me',
    'Whis',
    'LOOC',
    'OOC',
    'Admin',
  ]; // EXOSTATION EDIT ADDITION END
  private readonly blacklist: Channel[] = ['Admin'];
  private readonly quiet: Channel[] = ['OOC', 'LOOC', 'Admin']; // EXOSTATION EDIT ADDITION - COM_VERBS : LOOC

  public next(): Channel {
    if (this.blacklist.includes(this.channels[this.index])) {
      return this.channels[this.index];
    }

    for (let index = 1; index <= this.channels.length; index++) {
      let nextIndex = (this.index + index) % this.channels.length;
      if (!this.blacklist.includes(this.channels[nextIndex])) {
        this.index = nextIndex;
        break;
      }
    }

    return this.channels[this.index];
  }

  public set(channel: Channel): void {
    this.index = this.channels.indexOf(channel) || 0;
  }

  public current(): Channel {
    return this.channels[this.index];
  }

  public isSay(): boolean {
    return this.channels[this.index] === 'Say';
  }

  public isVisible(): boolean {
    return !this.quiet.includes(this.channels[this.index]);
  }

  public reset(): void {
    this.index = 0;
  }
}
