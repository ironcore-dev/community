import { withMermaid } from "vitepress-plugin-mermaid";
import { fileURLToPath, URL } from 'node:url'

// https://vitepress.dev/reference/site-config
export default withMermaid({
  title: "IronCore Project",
  description: "IronCore Project",
  base: '/community/',
  head: [
      ['link', { rel: 'icon', href: 'https://raw.githubusercontent.com/ironcore-dev/ironcore/refs/heads/main/docs/assets/logo_borderless.svg' }],
      ['meta', {property: 'og:type', content: 'website'}],
      ['meta', {property: 'og:title', content: 'IronCore Project - Cloud Native Infrastructure Management'}],
      ['meta', {property: 'og:description', content: 'IronCore is an Open-Source platform designed to empower users by providing a robust Infrastructure as a Service layer, Bare Metal Management and Network Automation'}],
      ['meta', {property: 'og:site_name', content: 'IronCore Project'}],
      ['meta', {property: 'og:image', content: 'https://raw.githubusercontent.com/ironcore-dev/ironcore-dev.github.io/refs/heads/main/docs/public/og-ironcore.png'}],
      ['meta', {property: 'og:url', content: 'https://ironcore.dev/', target: '_self'}],
  ],
  vite: {
    resolve: {
      alias: [
        {
          find: /^.*\/VPFooter\.vue$/,
          replacement: fileURLToPath(
            new URL('./theme/components/VPFooter.vue', import.meta.url)
          )
        },
      ]
    }
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: 'https://ironcore.dev/', target: '_self' },
      { text: 'Overview', link: 'https://ironcore.dev/overview/', target: '_self' },
      {
        text: 'Documentation',
        items: [
          { text: 'Infrastructure as a Service', link: 'https://ironcore.dev/iaas/getting-started', target: '_self' },
          { text: 'Bare Metal Management', link: 'https://ironcore.dev/baremetal/', target: '_self' },
          { text: 'Network Automation', link: 'https://ironcore.dev/network-automation/', target: '_self' },
        ]
      },
      { text: 'Community', link: '/' },
    ],

    editLink: {
      pattern: 'https://github.com/ironcore-dev/community/blob/main/docs/:path',
      text: 'Edit this page on GitHub'
    },

    logo: {
      src: 'https://raw.githubusercontent.com/ironcore-dev/ironcore/refs/heads/main/docs/assets/logo_borderless.svg',
      width: 24,
      height: 24
    },

    search: {
      provider: 'local'
    },

    sidebar: {
      '/': [
        {
          text: 'Community',
          items: [
            { text: 'Welcome', link: '/' },
            { text: 'Contributing Guide', link: '/contributing' },
            { text: 'Release Process', link: '/release-process' },
            { text: 'Membership', link: '/membership' },
          ],
        },
        {
          text: 'Style Guide',
          collapsed: false,
          items: [
            { text: 'Coding', link: '/style-guide/coding' },
            { text: 'Documentation', link: '/style-guide/documentation' },
          ],
        },
      ],
    },
    socialLinks: [
      {
        icon: 'github',
        link: 'https://github.com/ironcore-dev',
      },
      {
        icon: 'slack',
        link: 'https://join.slack.com/t/ironcore-dev/shared_invite/zt-3o0qo3j90-pbqV0io1B~Z~LqeAp4n2Vg'
      },
    ],
  }
})
