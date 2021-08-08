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
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
