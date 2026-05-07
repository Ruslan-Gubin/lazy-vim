import { defineConfig } from "eslint/config";

const eslintConfig = defineConfig([
  {
    rules: {
      "react/no-unescaped-entities": "off",
      "@next/next/no-page-custom-font": "off",
      "no-unused-vars": "warn",
      "no-console": "off",
      "no-debugger": "off",
      "no-var": "error",
    },
  },
]);

export default eslintConfig;
