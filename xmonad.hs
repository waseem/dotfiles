-- Imports --
-- stuff

import XMonad

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

-- utilities
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ def
    {
      borderWidth        = 1
    , normalBorderColor  = colorGrey
    , focusedBorderColor = colorBlue
    , terminal           = "gnome-terminal"
    , manageHook         = manageDocks <+> myManageHook
                                       <+> manageHook def
    , layoutHook         = avoidStruts  $ layoutHook def
    , handleEventHook    = handleEventHook def <+> docksEventHook
    , logHook            = dynamicLogWithPP xmobarPP
                             {
                               ppOutput      = hPutStrLn xmproc
                             , ppCurrent     = xmobarColor colorBlue "" . wrap "[" "]"
                             , ppTitle       = xmobarColor "grey" "" . shorten 128
                             }
    } `additionalKeys`
    [
      ((mod1Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock") -- Lock screen
    , ((mod1Mask .|. shiftMask, xK_Return), spawn "gnome-terminal") -- Make terminal use a login shell
    , ((mod1Mask, xK_p),               spawn myDmenu)
    , ((0, xK_Print),                  spawn "scrot") -- Screengrab of whole desktop. Saved to ~/
    ]

-- Colors
colorBlack   = "#000000"
colorGrey    = "#484848"
colorBlue    = "#60a0c0"
colorBlueAlt = "#007b8c"
colorRed     = "#d74b73"
colorMagenta = "#8e82a2"

-- Dmenu
myDmenu = "dmenu_run -b -nb '" ++ colorBlack ++ "' -nf '" ++ colorBlue ++ "' -sb '" ++ colorBlueAlt ++ "'"

-- Manage floating windows
myManageHook = composeAll [
                            className =? "MPlayer"  --> doFloat
                          , className =? "Gimp"     --> doFloat
                          , className =? "Vlc"      --> doFloat
                          ]
