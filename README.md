# Config

1. Clone this repository into "$HOME/Code/github.com/diorman-janeapp/config"
2. Install [homebrew](https://brew.sh/)
3. Install homebrew packages
    ```
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew bundle
    ```
4. Set github email environment variable (GITHUB_EMAIL)
5. Create gpg key
    ```
    gpg --batch --full-generate-key <<EOF
    Key-Type: 1
    Key-Length: 4096
    Subkey-Type: 1
    Subkey-Length: 4096
    Name-Real: Diorman Colmenares
    Name-Email: $GITHUB_EMAIL
    Expire-Date: 0
    EOF
    ```
6. Create ssh key
    ```
    ssh-keygen -t ed25519 -C "$GITHUB_EMAIL"
    ```
7. Create config symlinks
    ```
    make stow
    ```
8. Set up fish as default shell
    ```
    which fish | sudo tee -a /etc/shells
    chsh -s "$(which fish)"
    ```
9. Apply macOS defaults
    ```
    ./macos-settings.sh
    ```
10. Log out/in
