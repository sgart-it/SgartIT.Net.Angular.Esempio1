export interface ResponseBase {
  correlationId: number;
  errors: string[];
}

export interface ResponseData<T> extends ResponseBase {
  data: T;
}
export interface ResponseList<T> extends ResponseBase {
  data: T[];
}
