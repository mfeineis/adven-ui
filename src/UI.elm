module UI
    exposing
        ( mainContent
        , mainMenu
        , mainMenuItem
        , mainPage
        , mainSidebar
        , mainSidebarItem
        )


import Css exposing (..)
import Html.Styled as Styled exposing (Attribute, Html, styled)


theme =
    { borderColor = hex "888888"
    , menuWidth = px 350
    , spacing = px 18
    , unit = px 50
    }


mainContent : List (Attribute msg) -> List (Html msg) -> Html msg
mainContent =
    styled Styled.div
        [ height (vh 100)
        , width (vw 100)
        ]


mainMenu : List (Attribute msg) -> List (Html msg) -> Html msg
mainMenu =
    styled Styled.ol
        [ backgroundColor (hex "ffffff")
        , borderRight3 (px 1) solid theme.borderColor
        , height (vh 100)
        , hover
            [ opacity (num 0.8)
            ]
        , left theme.unit
        , listStyle none
        , margin zero
        , opacity (num 0.4)
        , padding zero
        , position absolute
        , width theme.menuWidth
        ]


mainMenuItem : List (Attribute msg) -> List (Html msg) -> Html msg
mainMenuItem attrs children =
    styled Styled.li
        [ cursor pointer
        , hover
            [ backgroundColor (hex "555555")
            ]
        , width theme.menuWidth
        ]
        attrs
        [ styled Styled.button
            [ backgroundColor transparent
            , border zero
            , color (hex "333333")
            , cursor pointer
            , padding theme.spacing
            , textAlign left
            , width theme.menuWidth
            ]
            []
            children
        ]


mainPage : List (Attribute msg) -> List (Html msg) -> Html msg
mainPage attrs children =
    styled Styled.div
        [ height (vh 100)
        , position relative
        , width (vw 100)
        ]
        attrs
        ([ baseStyle ] ++ children)


mainSidebar : List (Attribute msg) -> List (Html msg) -> Html msg
mainSidebar =
    styled Styled.ol
        [ backgroundColor (hex "888888")
        , height (vh 100)
        , hover
            [ opacity (num 0.8)
            ]
        , listStyle none
        , margin zero
        , opacity (num 0.4)
        , padding zero
        , position absolute
        , width theme.unit
        ]


mainSidebarItem : List (Attribute msg) -> List (Html msg) -> Html msg
mainSidebarItem attrs children =
    styled Styled.li
        [ cursor pointer
        , displayGrid
        , height theme.unit
        , hover
            [ backgroundColor (hex "555555")
            ]
        , width theme.unit
        ]
        attrs
        [ styled Styled.button
            [ backgroundColor transparent
            , border zero
            , color (hex "ffffff")
            , cursor pointer
            , margin auto
            , padding zero
            ]
            []
            children
        ]


displayGrid : Style
displayGrid =
    Css.property "display" "grid"


baseStyle : Html msg
baseStyle =
    Styled.node "style"
        []
        [ Styled.text
            """
html {
    box-sizing: border-box;
}
body {
    margin: 0;
    padding: 0;
}
*, *:before, *:after {
    box-sizing: inherit;
}
.i18n--editing [data-i18n] {
    border: 3px dotted red;
}
.i18n--editing [data-i18n].focused {
    background-color: #fdd;
}
input[contenteditable=true] {
  /*content: attr(placeholder);*/
  display: block; /* For Firefox */
}
pre {
    background: #eee;
    border: 1px solid #ddd;
}
            """
        ]
