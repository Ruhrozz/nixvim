{
  plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [
        "all"
        "TroubleNormal"
        "TroubleNormalNC"
        "TroubleCount"
        "TroubleFsCount"
        "TelescopeBorder"
        "DiagnosticSignError"
        "DiagnosticSignWarn"
        "DiagnosticSignWarn"
        "DiagnosticSignInfo"
        "DiagnosticSignHint"
        "GitSignsAdd"
        "GitSignsAddNr"
        "GitSignsAddLn"
        "GitSignsChange"
        "GitSignsChangeNr"
        "GitSignsChangeLn"
        "GitSignsDelete"
        "GitSignsDeleteNr"
        "GitSignsDeleteLn"
        "GitSignsTopdelete"
        "GitSignsTopdeleteNr"
        "GitSignsTopdeleteLn"
        "GitSignsChangedelete"
        "GitSignsChangedeleteNr"
        "GitSignsChangedeleteLn"
      ];
      exclude_groups = [ "StatusLine" "CursorLine" ];
    };
  };
}
