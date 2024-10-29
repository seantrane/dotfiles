module.exports = [
  {
    env: {
      browser: true,
      es6: true,
      jest: true,
    },
    globals: {
      Atomics: 'readonly',
      SharedArrayBuffer: 'readonly',
    },
    ignorePatterns: [
      '!.*',
      '.devcontainer/*',
      '.vscode/*',
      '**/node_modules/*',
      '**/Library/Application Support/Code/User/*',
    ],
    parser: '@typescript-eslint/parser',
    parserOptions: {
      ecmaVersion: 2018,
      sourceType: 'module',
    },
    plugins: ['@typescript-eslint'],
  },
];
