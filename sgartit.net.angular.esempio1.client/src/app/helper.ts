const isNullOrWhiteSpace = (str: string): boolean => {
  if ('string' !== typeof str) throw 'Invalid type';
  if (undefined === str || null === str) return true;
  if ((/^\s*$/g).test(str)) return true;
  return false;
};

export const H = {
  isNullOrWhiteSpace
};
