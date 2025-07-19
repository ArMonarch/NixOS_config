_: {
  security = {
    rtkit.enable = true;

    pam.services.swaylock = {
      text = ''auth include login '';
    };
  };
}
