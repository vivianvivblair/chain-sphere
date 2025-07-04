#!/usr/bin/env bash

# Создаём файл логов, если он ещё не создан
touch log.txt

# Функция генерации случайного сообщения для коммита
generate_commit_message() {
  local verbs=("Fix" "Add" "Improve" "Update" "Refactor" "Remove" "Optimize")
  local objects=("RPC handler" "CLI argument" "ENS lookup" "token logic" "address parser" "logging" "balance fetch" "validator check" "output format" "retry logic")
  local contexts=("flow" "code" "support" "case" "handler" "logic")

  local verb=${verbs[$RANDOM % ${#verbs[@]}]}
  local object=${objects[$RANDOM % ${#objects[@]}]}
  local context=${contexts[$RANDOM % ${#contexts[@]}]}

  echo "$verb $object $context"
}

# Запускаем цикл для 10 коммитов
for i in {10..20}; do
  echo "entry $i" >> log.txt                       # Запись в лог
  git add .                                        # Добавляем все изменения
  export GIT_AUTHOR_DATE="$(date -d "$((RANDOM % 100 + 1)) days ago" '+%Y-%m-%dT12:00:00')"  # Дата автора
  export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"      # Дата коммитера
  git commit -m "$(generate_commit_message)"       # Создаём коммит с рандомным сообщением
  git push origin main                             # Пушим коммит на GitHub
  sleep $((RANDOM % 16 + 15))                       # Задержка, чтобы не казалось спамом
done
