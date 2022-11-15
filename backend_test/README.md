# backendの切り替えテスト

## 準備

* (これは作成済み)下記の内容で設定が空のbackendを定義( `backend.tf` 参照)

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {}
}
```

* `backend/backend.tf.sample` を `backend/*.tf` の名前で2つ複製し、それぞれ別のバケットを指定する
* `tfvars/tfvars.sample` を `tfvars/*.tfvars` の名前で2つ複製し、それぞれ別の値を指定する

## 実践

* 下記のコマンドで片方の `bakcend/*.tf` の設定で `terraform init` する

```sh
# ここではbackend/a.tfとする
terraform init -backend-config backend/a.tf
```

* planしてデプロイする

```sh
# ここではtfvarsをa.tfvarsとする
terraform plan -var-file tfvars/a.tfvars
terraform apply -var-file tfvars/a.tfvars
```

* 次はもう片方のbackendで再度 `terraform init` する
    * その際、オプションに `-reconfigure` を指定する

```sh
# ここではbackend/b.tfとする
terraform init -reconfigure -backend-config backend/b.tf
```

* もう片方のtfvarsを使用してpaln、デプロイする

```sh
# ここではtfvarsをb.tfvarsとする
terraform plan -var-file tfvars/b.tfvars
terraform apply -var-file tfvars/b.tfvars
```

* 再度backendを最初のものに切り替える

```sh
terraform init -reconfigure -backend-config backend/a.tf
```

* iam.tfに変更を加え、リソースが更新できていることを確認する
* もう片方も同様に、再度backendを切り替えてリソースを更新できることを確認する
