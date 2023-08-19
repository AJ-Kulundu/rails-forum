const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    colors:{
      primary: "#a78bfa",
      secondary: "#a4cbb4",               
      accent: "#dc8850",               
      neutral: "#2e282a",               
      baseColor: "#e4d8b4",               
      info: "#2463eb",               
      success: "#16a249",               
      warning: "#db7706",               
      error: "#dc2828",
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
