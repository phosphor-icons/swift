<img src="/meta/phosphor-mark-tight-black.png" width="128" align="right" />

# @phosphor-icons/swift

Phosphor is a flexible icon family for interfaces, diagrams, presentations — whatever, really. Explore all our icons at [phosphoricons.com](https://phosphoricons.com).

[![GitHub Tag](https://img.shields.io/github/v/tag/phosphor-icons/swift?style=flat-square&label=Latest)](https://github.com/phosphor-icons/swift/tags)

[![GitHub stars](https://img.shields.io/github/stars/phosphor-icons/swift?style=flat-square&label=Star)](https://github.com/phosphor-icons/core)
[![GitHub forks](https://img.shields.io/github/forks/phosphor-icons/swift?style=flat-square&label=Fork)](https://github.com/phosphor-icons/core/fork)
[![GitHub watchers](https://img.shields.io/github/watchers/phosphor-icons/swift?style=flat-square&label=Watch)](https://github.com/phosphor-icons/swift)
[![Follow on GitHub](https://img.shields.io/github/followers/rektdeckard?style=flat-square&label=Follow)](https://github.com/rektdeckard)

## Installation

Add this repo as a new Package Dependency with `File > Add Package Dependencies...` and enter this URL in the search bar:

```
https://github.com/phosphor-icons/swift
```

Choose appropriate version ranges, or use the `main` branch for the most recent version.

## Usage

All icons are present on the `Ph` enum as computed properties that return a SwiftUI `Image`, plus some special sauce. To render an icon, use the computed weight property on the enum member, i.e. `Ph.<name>.<weight>`:

```swift
import SwiftUI
import PhosphorSwift

struct ContentView: View {
    var body: some View {
        HStack {
            Ph.horse.regular
                .color(.accentColor)
                .frame(width: 64, height: 64)
            Ph.heart.fill
                .color(.red)
                .frame(width: 64, height: 64)
            Ph.cube.duotone
                .frame(width: 64, height: 64)
        }   
    }
}
```

> [!NOTE]
> By default, all icon images are `.resizable()` and rendered with `.interpolation(Image.Interpolation.medium)` for scalable, antialiased icons at any size, without much overhead. The frame can be sized manually, or an icon will fit the size of its parent frame – though it is recommended to use `.aspectRatio(contentMode: .fit)` to retain the icon's original (square) aspect ratio in this case.

Color can be applied with the `.color(_: Color)` modifier, which at present is simply a `View` extension which applies a `ViewModifier` to any view, causing a color mask to be applied to that view's non-transparent elements.

If weight is dynamic, you can use the `.weight(_: Ph.IconWeight)` method to render a weight that is not known at compile time, or to use different weights as states (e.g. active/inactive).

<!-- BEGIN_LINKS -->
## Our Related Projects

- [@phosphor-icons/homepage](https://github.com/phosphor-icons/homepage) ▲ Phosphor homepage and general info
- [@phosphor-icons/core](https://github.com/phosphor-icons/core) ▲ Phosphor icon assets and catalog
- [@phosphor-icons/react](https://github.com/phosphor-icons/react) ▲ Phosphor icon component library for React
- [@phosphor-icons/web](https://github.com/phosphor-icons/web) ▲ Phosphor icons for Vanilla JS
- [@phosphor-icons/vue](https://github.com/phosphor-icons/vue) ▲ Phosphor icon component library for Vue
- [@phosphor-icons/swift](https://github.com/phosphor-icons/swift) ▲ Phosphor icon component library for SwiftUI
- [@phosphor-icons/elm](https://github.com/phosphor-icons/phosphor-elm) ▲ Phosphor icons for Elm
- [@phosphor-icons/flutter](https://github.com/phosphor-icons/flutter) ▲ Phosphor IconData library for Flutter
- [@phosphor-icons/webcomponents](https://github.com/phosphor-icons/webcomponents) ▲ Phosphor icons as Web Components
- [@phosphor-icons/figma](https://github.com/phosphor-icons/figma) ▲ Phosphor icons Figma plugin
- [@phosphor-icons/sketch](https://github.com/phosphor-icons/sketch) ▲ Phosphor icons Sketch plugin
- [@phosphor-icons/pack](https://github.com/phosphor-icons/pack) ▲ Phosphor web font stripper to generate minimal icon bundles
- [@phosphor-icons/theme](https://github.com/phosphor-icons/theme) ▲ A VS Code (and other IDE) theme with the Phosphor color palette

## Community Projects

- [phosphor-react-native](https://github.com/duongdev/phosphor-react-native) ▲ Phosphor icon component library for React Native
- [phosphor-svelte](https://github.com/haruaki07/phosphor-svelte) ▲ Phosphor icons for Svelte apps
- [phosphor-r](https://github.com/dreamRs/phosphoricons) ▲ Phosphor icon wrapper for R documents and applications
- [blade-phosphor-icons](https://github.com/codeat3/blade-phosphor-icons) ▲ Phosphor icons in your Laravel Blade views
- [wireui/phosphoricons](https://github.com/wireui/phosphoricons) ▲ Phosphor icons for Laravel
- [phosphor-css](https://github.com/lucagoslar/phosphor-css) ▲ CSS wrapper for Phosphor SVG icons
- [ruby-phosphor-icons](https://github.com/maful/ruby-phosphor-icons) ▲ Phosphor icons for Ruby and Rails applications
- [eleventy-plugin-phosphoricons](https://github.com/reatlat/eleventy-plugin-phosphoricons) ▲ An Eleventy plugin for add shortcode, allows Phosphor icons to be embedded as inline svg into templates
- [phosphor-leptos](https://github.com/SorenHolstHansen/phosphor-leptos) ▲ Phosphor icon component library for Leptos apps (rust)
- [wordpress-phosphor-icons-block](https://github.com/robruiz/phosphor-icons-block) ▲ Phosphor icon block for use in WordPress v5.8+
- [ember-phosphor-icons](https://github.com/IgnaceMaes/ember-phosphor-icons) ▲ Phosphor icons for Ember apps

If you've made a port of Phosphor and you want to see it here, just open a PR [here](https://github.com/phosphor-icons/homepage)!

## License

MIT © [Phosphor Icons](https://github.com/phosphor-icons)
<!-- END_LINKS -->
