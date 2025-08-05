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
            padding-top:0px;
            padding-bottom:0px;
          }
        '';

        # extraCss = ''
        #   headerbar {
        #       min-height: 10px;
        #       padding: 0px;
        #   }
        #
        #   headerbar entry,
        #   headerbar spinbutton,
        #   headerbar button,
        #   headerbar separator {
        #       margin-top: 0px;
        #       margin-bottom: 0px;
        #       padding: 2px;
        #       min-width: 0px;
        #       min-height: 0px;
        #   }
        #   headerbar windowhandle {
        #       margin-top: 0px;
        #       margin-bottom: 0px;
        #       min-height: 8px;
        #       padding: 0px;
        #   }
        #   headerbar windowhandle box {
        #       margin-top: 1px;
        #       margin-bottom: 1px;
        #       margin-right: 4px;
        #       margin-left: 4px;
        #       padding: 0px;
        #   }
        #   headerbar windowhandle label {
        #       padding: 1px;
        #   }
        #
        #   headerbar windowhandle box.end button image  {
        #       min-height: 8px;
        #   }
        #
        #   .default-decoration {
        #       min-height: 0; /* let the entry and button drive the titlebar size */
        #       padding: 1px;
        #       margin-bottom: 0px;
        #   }
        # '';
      };
    };
  };
}
