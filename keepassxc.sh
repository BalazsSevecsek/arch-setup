sudo pacman -S --noconfirm --needed keepassxc

if [ -d ~/gdrive ]; then
    echo "Directory ~/gdrive already exists."
else
    mkdir ~/gdrive
fi

if [-d ~/google-drive-ocamlfuse ]; then
    echo "Directory ~/google-drive-ocamlfuse already exists."
else
    git clone https://github.com/astrada/google-drive-ocamlfuse.git ~/google-drive-ocamlfuse
    cd ~/google-drive-ocamlfuse
    # Install OCaml and opam
    sudo pacman  -S --noconfirm --needed ocaml opam dune
    
    # Initialize opam
    opam init -y
    eval $(opam env)
    opam update
    opam install -y ocamlfind
    opam install -y ocamlfuse
    opam install -y gapi-ocaml
    opam install -y sqlite3
    opam install -y tiny_httpd
    opam install -y extlib
    dune build @install
    
    google-drive-ocamlfuse --version
    
    #Test if systemd service file exists, if not copy it
    if [ -f /etc/systemd/system/google-drive-ocamlfuse.service ]; then
        echo "Service file already exists."
    else
        sudo cp ./config/systemd/google-drive-ocamlfuse.service ~/.config/systemd/user/
        echo "Service file copied to ~/.config/systemd/user/"
        sudo systemctl daemon-reload
        systemctl --user enable --now google-drive-ocamlfuse.service
    fi
fi




#Use your own client id and secret to launch google drive ocamlfuse
# google-drive-ocamlfuse -id xxxxxxxxxx.apps.googleusercontent.com -secret XXX-YYY-ZZZ


###################### RCLONE AS AN ALTERNATIVE ##########################
# sudo pacman -S --needed --noconfirm rclone

# if [ -d ~/.config/rclone ]; then
#     echo "Rclone config directory already exists."
# else
#     rclone config create
#     # with following flags:
#     # -this must be a new remote config with the name gdrive
#     # -kind must be drive
#     # -with  default client id ("")
#     # -full access drive (drive)
#     # -root folder must be default ("")
#     # -  service account file default ("")
#     # - no advanced config
#     # - yes to auto config
#     # - no to team drive
#     echo "Rclone config created."
# fi

# if [ -d /home/sevi/gdrive ]; then
#     echo "Directory /home/sevi/gdrive already exists."
# else
#     mkdir /home/sevi/gdrive
# fi

# # echo "rclone mount gdrive: /home/sevi/gdrive --daemon" >> /home/sevi/.xinitrc

# if [ -f /etc/systemd/system/rclone-gdrive.service ]; then
#     echo "Service file already exists."
# else
#     #copy config/systemd folder's content to /etc/systemd/system
#     sudo cp -r config/systemd/* ~/.config/systemd/user/
#     echo "Service file copied to ~/.config/systemd/user/."
# fi

# systemctl --user enable --now rclone-gdrive.service

