# file-management-system
> Light, Modern, Progresive ERP System.   
> NuxtJS Front-End.   
> Vuetify Design Framework.   
> phpExpress Back-End.   
> phpSequelize ORM.
## Build Setup

```bash
# install dependencies
$ yarn install

# serve with front hot reload at localhost:3000
$ yarn dev

# generate static project
$ yarn build
$ yarn generate

# serve with back hot reload at localhost:4000
$ yarn back
```

For detailed explanation on how things work, check out the [documentation](https://nuxtjs.org).

***
## Special Directories

You can create the following extra directories, some of which have special behaviors. Only `pages` is required; you can delete them if you don't want to use their functionality.

### `assets`

The assets directory contains your uncompiled assets such as Stylus or Sass files, images, or fonts.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/assets).

### `components`

The components directory contains your Vue.js components. Components make up the different parts of your page and can be reused and imported into your pages, layouts and even other components.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/components).

### `layouts`

Layouts are a great help when you want to change the look and feel of your Nuxt app, whether you want to include a sidebar or have distinct layouts for mobile and desktop.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/layouts).


### `pages`

This directory contains your application views and routes. Nuxt will read all the `*.vue` files inside this directory and setup Vue Router automatically.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/get-started/routing).

### `plugins`

The plugins directory contains JavaScript plugins that you want to run before instantiating the root Vue.js Application. This is the place to add Vue plugins and to inject functions or constants. Every time you need to use `Vue.use()`, you should create a file in `plugins/` and add its path to plugins in `nuxt.config.js`.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/plugins).

### `static`

This directory contains your static files. Each file inside this directory is mapped to `/`.

Example: `/static/robots.txt` is mapped as `/robots.txt`.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/static).

### `static/api`

This directory contains your restAPI for php files. Can write code php7 likes Nodejs Express style, Sequelize.

More information about the usage of this directory in [the documentation](https://github.com/devxian96/phpExpress).


### `store`

This directory contains your Vuex store files. Creating a file in this directory automatically activates Vuex.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/store).

***
## CodeStyle

### `commitlint`
```
feat        A new feature.
fix         A bug fix.
docs        Documentation only changes.
style       Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
refactor    A code  change that neither fixes a bug nor adds a feature.
test         Adding missing tests or correcting existing ones.
chore       Changes to the build process or auxiliary tools and libraries such as documentation generation.
perf        A code change that improves performance.
ci          Changes to your CI configuration files and scripts.
build       Changes that affect the build system or external dependencies (example scopes: gulp, broccli, npm).
temp        Temporary commit that wont`t be included in your CHANGELOG.
```