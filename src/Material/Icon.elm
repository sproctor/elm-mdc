module Material.Icon exposing
    ( Property
    , size18
    , size24
    , size36
    , size48
    , view
    )

{-| Convenience functions for producing Material Design Icons. Refer to the
[Material Design Icons page](https://google.github.io/material-design-icons),
or skip straight to the [Material Icons Library](https://design.google.com/icons/).

This implementation assumes that you have

```html
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
```

or an equivalent means of loading the icons in your HTML header.


# Example

```elm
import Material.Icon as Icon


Icon.view [] "settings"
```


# Usage

@docs Property
@docs view
@docs size18
@docs size24
@docs size36
@docs size48
-}

import Html exposing (Html)
import Material.Internal.Icon.Implementation as Icon


{-| Icon property.
-}
type alias Property m =
    Icon.Property m


{-| Icon view.
-}
view : List (Property m) -> String -> Html m
view =
    Icon.view


{-| Set icon to have size 18px.
-}
size18 : Property m
size18 =
    Icon.size18


{-| Set icon to have size 24px.
-}
size24 : Property m
size24 =
    Icon.size24


{-| Set icon to have size 36px.
-}
size36 : Property m
size36 =
    Icon.size36


{-| Set icon to have size 48px.
-}
size48 : Property m
size48 =
    Icon.size48
