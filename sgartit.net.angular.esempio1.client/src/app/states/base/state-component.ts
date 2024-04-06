import { BaseState } from "./base-state";
import { IStateStore } from "./istate-store";
import * as localStorageStateStore from './storage-state-store';
export abstract class StateComponent<TState extends BaseState>{
  stateStore: IStateStore = localStorageStateStore.default;
  pageState: TState;

  constructor(type: (new () => TState)) {
    this.pageState = new type();
    this.loadState();
  }

  setState(newValues: Partial<TState>) {
    var oldValue = this.getOldValues(newValues);
    Object.assign(this.pageState, newValues);
    this.saveState();
    this.onStateChanged(oldValue, newValues);
  }

  getOldValues(newValues: Partial<TState>): Partial<TState> {
    var oldValues = {} as Partial<TState>;
    for (var key of Object.keys(newValues)) {
      updateProperty(oldValues, this.pageState, key as keyof TState)
    }
    return oldValues as Partial<TState>
  }

  abstract onStateChanged(oldValues: Partial<TState>, newValues: Partial<TState>): void;

  loadState() {
    var result = <TState>this.stateStore.loadState<TState>(this.GetStateName());
    if (result != null) {
      this.pageState = result;
    }
  }

  saveState() {
    this.stateStore.saveState(this.GetStateName(), this.pageState);
  }

  GetStateName(): string {
    return this.pageState.name;
  }
}

function updateProperty<TState, K extends keyof TState>(target: TState, source: TState, propertyName: K) {
  target[propertyName] = source[propertyName];
}
