# メモ

## .terraform-version

プロジェクト内に使用するTerraformのバージョンを記載した `.terraform-version` を格納しておくと、tfenvを使用している場合に `tfenv install` を実行するだけでそのバージョンに合わせることができる

## デプロイまで

```sh
# 実行に必要なプロバイダ等をダウンロードする
terraform init

# 変更内容を確認
terraform plan

# 実行
terraform apply

# さようなら
terraform destroy
```

## 変数を指定

`main.tf` の内容で変数を定義し、実行時に値を渡す場合は以下

```sh
terraform plan -var 'example_instance_type=t3.nano'
```

## .gitignore

参考なりそうなのはこのあたり

[github/gitignore - Terraform.gitignore](https://github.com/github/gitignore/blob/main/Terraform.gitignore)
