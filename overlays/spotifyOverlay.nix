self: super: {
  spotify = super.spotify.overrideAttrs (old: {
    postFixup =
      (old.postFixup or "")
      + ''
        if [ -x "$out/bin/spotify" ]; then
            wrapProgram $out/bin/spotify \
              --add-flags "--ozone-platform=x11"
          fi
      '';
  });
}
