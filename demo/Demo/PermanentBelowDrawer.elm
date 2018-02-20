module Demo.PermanentBelowDrawer exposing
    (
      Model
    , defaultModel
    , Msg(Mdl)
    , update
    , view
    , subscriptions
    )

import Demo.Page as Page exposing (Page)
import Html as Html_
import Html.Attributes as Html
import Html exposing (Html, text, map)
import Material
import Material.Drawer
import Material.Drawer.Permanent as Drawer
import Material.Elevation as Elevation
import Material.List as Lists
import Material.Options as Options exposing (styled, cs, css, when)
import Material.Toolbar as Toolbar
import Material.Typography as Typography
import Platform.Cmd exposing (Cmd, none)


-- MODEL


type alias Model =
    { mdl : Material.Model
    , toggle0 : Bool
    , toggle1 : Bool
    }


defaultModel : Model
defaultModel =
    { mdl = Material.defaultModel
    , toggle0 = False
    , toggle1 = False
    }


type Msg m
    = Mdl (Material.Msg m)
    | Toggle0
    | Toggle1


update : (Msg m -> m) -> Msg m -> Model -> ( Model, Cmd m )
update lift msg model =
    case msg of
        Mdl msg_ ->
            Material.update (Mdl >> lift) msg_ model
        Toggle0 ->
            { model | toggle0 = not model.toggle0 } ! []
        Toggle1 ->
            { model | toggle1 = not model.toggle1 } ! []


-- VIEW


view : (Msg m -> m) -> Page m -> Model -> Html m
view lift page model =
    styled Html.div
    [ cs "demo-body"
    , css "display" "flex"
    , css "flex-direction" "row"
    , css "padding" "0"
    , css "margin" "0"
    , css "box-sizing" "border-box"
    , css "height" "100%"
    , css "width" "100%"
    ]
    [ 
      page.toolbar "Permanent Drawer Below Toolbar"

    , styled Html.div
      [ cs "demo-content"
      , css "display" "flex"
      , css "flex" "1 1 auto"
      , css "height" "100%"
      , css "box-sizing" "border-box"
      , Toolbar.fixedAdjust
      ]
      [ 
        Drawer.render (Mdl >> lift) [0] model.mdl []
        [ Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "inbox"
          , text "Inbox"
          ]
        , Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "star"
          , text "Star"
          ]
        , Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "send"
          , text "Sent Mail"
          ]
        , Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "drafts"
          , text "Drafts"
          ]

        , Lists.divider [] []

        , Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "email"
          , text "All Mail"
          ]
        , Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "delete"
          , text "Trash"
          ]
        , Lists.listItem
          [ Options.attribute (Html.href "#permanent-drawer-below") ]
          [ Lists.graphicIcon [] "report"
          , text "Spam"
          ]
        ]

      , styled Html.div
        [ css "padding-left" "16px"
        ]
        [ styled Html.h1
          [ Typography.display1
          ]
          [ text "Permanent Drawer"
          ]
        , styled Html.p
          [ Typography.body2
          ]
          [ text "It sits to the left of this content."
          ]
        , styled Html.div
          [ css "padding" "10px"
          ]
          [ styled Html.button
            [ Options.onClick (lift Toggle0)
            ]
            [ text "Toggle extra-wide content"
            ]
          , styled Html.div
            [ css "width" "200vw"
            , css "display" "none" |> when (not model.toggle0)
            , Elevation.z2
            ]
            [ text "&nbsp;" ]
          ]
        , styled Html.div
          [ css "padding" "10px"
          ]
          [ styled Html.button
            [ Options.onClick (lift Toggle1)
            ]
            [ text "Toggle extra-tall content"
            ]
          , styled Html.div
            [ css "height" "200vh"
            , css "display" "none" |> when (not model.toggle1)
            , Elevation.z2
            ]
            [ text "&nbsp;" ]
          ]
        ]
      ]
    ]


subscriptions : (Msg m -> m) -> Model -> Sub m
subscriptions lift model =
    Material.Drawer.subs (Mdl >> lift) model.mdl
