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
  xmonad $ defaultConfig
    {
      borderWidth        = 2
    , normalBorderColor  = colorGrey
    , focusedBorderColor = colorBlue
    , manageHook         = manageDocks <+> myManageHook
                                       <+> manageHook defaultConfig
    , layoutHook         = avoidStruts  $ layoutHook defaultConfig
    , logHook            = dynamicLogWithPP xmobarPP
                             {
                               ppOutput      = hPutStrLn xmproc
                             , ppTitle       = xmobarColor "grey" "" . shorten 50
                             }
    } `additionalKeys`
    [
      ((mod1Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock") -- Lock screen
    , ((0, xK_Print),                  spawn "scrot") -- Screengrab of whole desktop. Saved to ~/
    ]

-- Colors
colorGrey    = "#484848"
colorBlue    = "#60a0c0"
colorRed     = "#d74b73"

-- Manage floating windows
myManageHook = composeAll [
                            className =? "MPlayer"  --> doFloat
                          , className =? "Gimp"     --> doFloat
                          , className =? "Vlc"      --> doFloat
                          ]
