_: {
  stylix = {
    enable = true;
    autoEnable = false;

    targets = {
      gtk = {
        enable = true;
        extraCss = ''
          window.ssd headerbar.titlebar {
            padding-top: 2px;
            padding-bottom: 2px;
            min-height: 0;
          }
          window.ssd headerbar.titlebar button.titlebutton {
              padding: 1px;
              min-height: 0;
              min-width: 0;
          }

          headerbar {
            min-height:20px;
          }

          windowhandle box {
            padding-top:1px;
            padding-bottom:0px;
          }
        '';
      };
    };
  };
}
