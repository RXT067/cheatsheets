# Developer notes

## Gitpod
This repository supports online IDE [gitpot](https://gitpod.io).

Note that you can preview build `html` files using built-in viewer.
!()[https://user-images.githubusercontent.com/11302521/70831797-bdfdb280-1df3-11ea-9501-e78f37224ec3.png]

## Starting a local instance

This starts Jekyll and Webpack. This requires recent versions of [Node.js], [Yarn], [Ruby] and [Bundler] installed.

```bash
yarn install
bundle install
env PORT=4001 yarn run dev
```

[node.js]: https://nodejs.org/en/download/package-manager/
[ruby]: https://www.ruby-lang.org/en/documentation/installation/
[yarn]: https://yarnpkg.com/en/docs/install
[bundler]: https://bundler.io/

### Docker

You can also run a local instance using Docker. This is the preferred method, especially for Windows.
You only need to install Docker ([macOS](https://docs.docker.com/docker-for-mac/install/), [Windows](https://docs.docker.com/docker-for-windows/install/), [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/), [Arch Linux](https://www.archlinux.org/packages/community/x86_64/docker/), [other](https://www.docker.com/community-edition#download)).

First time setup:

```bash
# Build images (takes ~12mins)
docker-compose build

# First-time setup
docker-compose run --rm web bundle install && yarn
```

Starting the server:

```bash
docker-compose up
```

## CSS classes

See <https://devhints.io/cheatsheet-styles> for a reference on styling.

## JavaScript

When updating JavaScript, be sure webpack is running (`yarn run dev` takes care of this).

This auto-updates `/assets/packed/` with sources in `_js/`.

## JavaScript tests

There are also automated tests:

```
yarn run test --watch
```

## Frontmatter

Each sheet supports these metadata:

```yml
---
title: React.js
layout: 2017/sheet   # 'default' | '2017/sheet'

# Optional:
category: React
updated: 2017-08-30       # To show in the updated list
ads: false                # Add this to disable ads
weight: -5                # lower number = higher in related posts list
deprecated: true          # Don't show in related posts
deprecated_by: /enzyme    # Point to latest version
prism_languages: [vim]    # Extra syntax highlighting
intro: |
  This is some *Markdown* at the beginning of the article.
tags:
  - WIP
  - Featured

# Special pages:
# (don't set these for cheatsheets)
type: home                # home | article | error
og_type: website          # opengraph type
---
```

## Prism languages

For supported prism languages:

- <https://github.com/PrismJS/prism/tree/gh-pages/components>

## Setting up redirects

This example sets up a redirect from `es2015` to `es6`:

```yml
# /es2015.md
---
title: ES2015
category: Hidden
redirect_to: /es6
---
```

## Localizations

See `_data/content.yml` for chrome strings.

## Forking

So you want to fork this repo? Sure, here's what you need to know to whitelabel this:

- It's all GitHub pages, so the branch has to be `gh-pages`.
- All other GitHub pages gotchas apply (CNAME, etc).
- Edit everything in `_data/` - this holds all 'config' for the site: ad IDs, strings, etc.
- Edit `_config.yml` as well, lots of things may not apply to you.

## CloudFlare purging

The site devhints.io is backed by CloudFlare. Updates will take 2 days to propagate to the website by default. To make sure recent changes will propagate, use this helper script. It will give instructions on how manual selective cache purging can be done.

```bash
./_support/cf-purge.sh
```

## SEO description

There are multiple ways to set meta description.

### keywords (and intro)

Set `keywords` (and optionally `intro`). This is the easiest and the preferred
way for now.

```
React cheatsheet - devhints.io
------------------------------
https://devhints.io/react ▼
React.Component · render() · componentDidMount() · props/state · React is a
JavaScript library for building web...
```

### description (and intro)

Set `description` (and optionally `intro`)

```
React cheatsheet - devhints.io
------------------------------
https://devhints.io/react ▼
One-page reference to React and its API. React is a JavaScript library for
building web user interfaces...
```

### intro only

If you left out `description` or `keywords`, a default description will be added.

## Critical path CSS

The critical path CSS is stored in:

- `_includes/2017/critical/home.html`
- `_includes/2017/critical/sheet.html`

You'll need to update these every now and then when you change something in the CSS. Use this to update these snippets:

```
yarn run critical
```

You can temporarily disable critical path optimizations by loading it with `?nocrit=1`, eg, `https://devhints.io/?nocrit=1`.

## Critical path JS

There's JavaScript that's included inline in every page. It's entrypoint is:

- `_js/critical.js`

This is automatically compiled into the partial `_includes/2017/critical/critical.js`. Keep this bundle as small as possible.
