module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: (theme) => ({
        'top-image': "url('/assets/room_title.jpg')",
      }),
      fontSize: {
        xxs: ['0.625em', { lineHeight: '1rem' }],
        xxxs: ['0.375em', { lineHeight: '1rem' }],
        xxxxs: ['0.25em', { lineHeight: '1rem' }],
      },
      colors: {
        app: {
          light: '#FF9966',
          middle: '#FF7733',
          DEFAULT: '#FF5500',
          dark: '#E64D00',
        },
        app_bg: {
          light: '#FFF538',
          DEFAULT: '#EDEDED',
          dark: '#C19A32',
        },
      },
      width: {
        '1/7': '14.2857143%',
        '2/7': '28.5714286%',
        '3/7': '42.8571429%',
        '4/7': '57.1428571%',
        '5/7': '71.4285714%',
        '6/7': '85.7142857%',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
