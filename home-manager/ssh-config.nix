{ lib, ... }:

{
  home.activation.createSshConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        mkdir -p $HOME/.ssh
        
        cat > $HOME/.ssh/config << 'EOF'
    Host lnu_gitlab
      HostName gitlab.lnu.se
      User git
      IdentityFile ~/.ssh/lnu_gitlab
      IdentitiesOnly yes

    Host *
      User plarpoon
      Port 22
      ForwardAgent no
      ForwardX11 no
      Compression yes
    EOF
        
        chmod 600 $HOME/.ssh/config
  '';
}
