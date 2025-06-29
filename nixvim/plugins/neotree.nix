{
  plugins.neo-tree = {
    enable = true;

    closeIfLastWindow = true;
    sources = [ "filesystem" "git_status" ];
    window.position = "float";

    filesystem.filteredItems = {
      hideDotfiles = false;
      hideGitignored = false;
      hideHidden = false;
    };
  };
}
