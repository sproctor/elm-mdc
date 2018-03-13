module Material.Fab exposing
    ( exited
    , mini
    , Property
    , ripple
    , view
    )

{-|
A floating action button represents the primary action in an application.


# Resources

- [Material Design guidelines: Buttons](https://material.io/guidelines/components/buttons-floating-action-button.html)
- [Demo](https://aforemny.github.io/elm-mdc/#fab)


# Example

```elm
import Material.Fab as Fab
import Material.Options as Options


Fab.view Mdc [0] model.mdc
    [ Fab.ripple
    , Options.onClick Click
    ]
    "favorite_border"
```


# Usage
@docs Property
@docs view
@docs Property
@docs mini
@docs ripple
@docs exited
-}

import Html exposing (Html)
import Material.Component exposing (Indexed, Index)
import Material.Internal.Fab.Implementation as Fab
import Material.Msg


{-| Fab property.
-}
type alias Property m =
    Fab.Property m


type alias Store s =
    { s | fab : Indexed Fab.Model }


{-| Fab view.
-}
view :
    (Material.Msg.Msg m -> m)
    -> Index
    -> Store s
    -> List (Property m)
    -> String
    -> Html m
view =
    Fab.view


{-| Make the Fab smaller than regular size.
-}
mini : Property m
mini =
    Fab.mini


{-| Animates the Fab out of view when this property is set.

It returns to view when this property is removed.
-}
exited : Property m
exited =
    Fab.exited


{-| Enable ripple effect on interaction.
-}
ripple : Property m
ripple =
    Fab.ripple
