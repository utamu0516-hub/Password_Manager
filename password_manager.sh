echo "パスワードマネージャーへようこそ！"


read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" selection


while [ "${selection}" != "Exit" ]; do


if [ "${selection}" = "Add Password" ]; then

read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" username
read -p "パスワードを入力してください：" password

echo "${service}:${username}:${password}" >> passwords.txt
echo "パスワードの追加に成功しました。"

elif [ "${selection}" = "Get Password" ]; then
read -p "サービス名を入力してください：" check

 if grep -q "${check}" passwords.txt; then
 grep "${check}:" passwords.txt

 else
 echo "そのサービスは登録されていません。"
 fi

else
echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
fi

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" selection

done

echo "Thank you!"

