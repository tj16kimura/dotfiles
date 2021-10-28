## Usage

1. シェルをzshに変更する

```sh
chsh -s $(which zsh)
```

2. curlをインストールしておく

(Ubuntu)

```sh
sudo apt install curl
```

3. ファイルをコピーする

```sh
git clone https://github.com/tj16kimura/dotfiles
```

4. インストール

```sh
cd dotfiles/scripts
./install.sh
```

5. 設定を読み込む

```sh
cd
source .zshrc
```
