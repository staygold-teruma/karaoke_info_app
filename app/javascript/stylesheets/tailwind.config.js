module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: (theme) => ({
        'top-image': "url('/assets/room_title.jpg')",
      }),
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
