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

## .gitignore

参考なりそうなのはこのあたり

[github/gitignore - Terraform.gitignore](https://github.com/github/gitignore/blob/main/Terraform.gitignore)
