import { IStateStore } from "./istate-store";

class StorageStateStore implements IStateStore {
  storage = sessionStorage; // sessionStorage | localStorage

  private setItem(key: string, value: string) {
    this.storage.setItem(key, value);
  }

  private getItem(key: string) {
    return this.storage.getItem(key)
  }


  loadState<TState>(name: string): TState {
    var stateStr = this.getItem(name) as string;

    var result = <TState>JSON.parse(stateStr);
    return result;
  }
  saveState(name: string, state: any): void {
    var stateString = JSON.stringify(state);
    this.setItem(name, stateString);
  }

}

export default new StorageStateStore();
