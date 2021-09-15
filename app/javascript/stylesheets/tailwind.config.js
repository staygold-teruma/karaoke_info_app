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
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
