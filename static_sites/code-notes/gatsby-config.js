module.exports = {
  /**
   * IMPORTANT: Must be kept in sync with `config/initializers/static.rb`.
   * - https://github.com/testdouble/static-rails#using-gatsby
   * - https://www.gatsbyjs.com/docs/reference/gatsby-cli/#serve
   *
   * IMPORTANT: `gatsby develop` aka `yarn dev` does NOT support `--path-prefix`.
   * That is why `gatsby serve` is used.
   * https://www.gatsbyjs.com/docs/reference/gatsby-cli/#develop
   * https://github.com/gatsbyjs/gatsby/discussions/16040
   */
  pathPrefix: "/rules",
  siteMetadata: {
    title: 'gatsby-starter-code-notes',
    description: `A starter for gatsby-theme-code-notes`,
    author: 'Zander',
  },
  plugins: [
    {
      resolve: 'gatsby-theme-code-notes',
      options: {
        contentPath: 'notes',
        basePath: '/',
        showThemeInfo: true,
        showDescriptionInSidebar: true,
        showDate: true,
        // gitRepoContentPath: 'https://github.com/mrmartineau/gatsby-starter-code-notes/tree/master/notes',
        // openSearch: {
        //   siteShortName: `My Code Notes`,
        //   siteUrl: 'https://my-website.com',
        //   siteTags: 'code',
        //   siteContact: 'https://twitter.com/???',
        //   siteDescription:
        //     'Code Notes',
        // },
      },
    },
  ],
}
