import { InjectionToken } from "@angular/core";
import { AppUser } from "./app-user";

export interface AppConfig {
  version: string;
  appTitle: string;
  currentUser: AppUser;
}

export const APP_CONFIG = new InjectionToken<AppConfig>('APP_CONFIG');
