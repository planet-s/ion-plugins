module.exports = {
  /*
  ** Set source directory
  */
  srcDir: 'src/',
  /*
  ** Headers of the page
  */
  head: {
    title: 'Ion Plugins',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Ion plugins selector' },
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
    ],
  },

  router: {
    base: '/ion-plugins/',
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Build configuration
  */
  build: {
    babel: {
      presets: ['@vue/app'],
    },
  },
};
