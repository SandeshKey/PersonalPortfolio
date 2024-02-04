/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    screens: {
      sm : '480px',
      md : '768px',
      lg : '976px',
      xl : '1440px',
    },
    extend: {
      colors: {
        mintShade : '#F7FFF7',
        textColor : '#353D46',
        linearDark : '#E6E2DB',
        linearLight : '#F6F6F4',
        overlay : 'rgba(255, 255, 255, .3)',
      },
      fontFamily: {
        firaCon: ['Fira Sans Condensed'],
        firaNormal: ['Fira Sans'],
        raleway: ['Raleway'],
      },
      lineHeight:{
        'noLineHeight': 0.75,
      },
      rotate: {
        '100' : '100deg',
      },
      fontSize:{
        smm: '0.75rem',
      }
    },
  },
  plugins: [],
}

