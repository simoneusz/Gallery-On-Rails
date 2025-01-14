## Аналитика действий пользователя
Приложение: простая галерея отображающая изображения разной тематики совмещенных категориями.

Найти и скачать 25 изображений разной тематики, по 5 каждой категорий. То-есть должно быть 5 категорий по 5 изображений.
Имя папки должно быть именем категории.

#### ruby 2.3 +, rails 5 +, postgresql, github
#### Обязательные гемы
* UI framework Bootstrap (https://github.com/twbs/bootstrap-sass)
* шаблонизатор haml (https://github.com/indirect/haml-rails)
* загрузка файлов Сarrierwave (https://github.com/carrierwaveuploader/carrierwave)
* Аутентификация devise (https://github.com/plataformatec/devise)
* Админ панель ActiveAdmin (https://github.com/activeadmin/activeadmin)
* Пагинация kaminari (https://github.com/kaminari/kaminari)
* Rspec фреймворк для тестов (https://github.com/rspec/rspec-rails)

## Требования

UI\дизайн приложения должен быть "стильным-модным-молодежным". Если проблемы с дизайном можно найти готовый шаблон и сверстать по нему. НО не готовая тема! В общем дизайн очень важен так как это пойдет в ваше портфолио. 
Дизайн должен быть адаптивным и отзывчивым. То-есть корректное отображение на ПК, ноутбуке, телефоне, планшете во всех браузерах (IE > 9)
Максимально использовать bootstrap. По возможности добавить как можно больше елементов типа модальных оков, тултипов и тд. но без злоупотребления. Как минимум одно модальное окно обязательно.

Создать rake\rails task, который создат категории по имени папки и заполнит категорию картинками с данной папки.
То-есть, в консоли пишем app:migrate_images, парсится папка, создаються категории и заполняются изображениями.

С помощью seed.rb создать пару комментариев и лайков.

Функционал юзера:
##### Пользователь может:

- Зарегестрироватся и залогинится.
- Востановить забытый пароль.
- Создавать новые категории.
- Загружать новые изображения.
- Удалять свои категории. (При удалении изображения должны удалиться все её изображения и комментарии изображений)
- Ставить лайки к картинкам(одна картинка - один лайк, отображается возле каждой картинки). Повторный лайк на изображение заберет лайк назад. (По принципу как в vk.com)
- Оставлять комментарии к картинкам(одна картинка - множество комментариев, отображается возле каждой картинки)
- Редактировать свои данные: пароль, имя, емеил.
- Удалить свой аккаунт.
- Подписыватся и отписыватся на\от категории.

##### Пользователь НЕ может:

- Редактировать и удалять свои комментарии.
- Редактировать и удалять свои изображения.
- Загружать изображения больше 50Мб.
- Загружать видео файлы, текстовые файлы и тд. Для загрузки доступны только файлы расширения .jpg, .jpeg, .png


#### Панель администратора

Админ панель должна быть доступна по пути /admin. Создается отдельно админ юзер, который не имеет отношения к пользовательскому функционалу.
На главной странице (dashboard) должны отображатся:
- 5 последних созданных категорий
- 5 последних комментариев
- 10 последних загруженных изображений
- Дейсвия всех пользователей (будет описано дальше)

#### Admin может:

- Создавать, редактировать, удалять все ресурсы приложения. (Категории, изображения, комментарии и тд)
- Создавать и удалять новых администраторов.
- Просматривать действия по каждому пользователю, разделённые по типу действия с возможностью фильтрации по пользователю. Возможные типы действий пользователя:
    - навигация пользователя(по каким страничкам переходил)
    - время, когда пользователь залогинился
    - время, когда пользователь разлогинился
    - отслеживание лайков на картинки
    - отслеживание комментариев на картинки
    
   | Пользователь | Действия | URL | Timestamp |
   | --- | --- | --- | --- |
   | example@email.com | action_type | localhost:3000/images/:id/ | 01.01.2001 29:00 
   | example2@email.com | action_type | localhost:3000/categories | 01.01.2001 29:00


   Где action_type может быть: navigation, user sign in, user sign out, likes, comments - ссылки где будет отображена информация по выбраному действию соответствующего пользователя.


#### Общее 

- Картинка должна получать 3 экземпляра
   + Полноразмерная - используется на /image/show
   + Тумба средняя - используется как preview на categories/index
   + Тумба маленькая (thumbnail) - используется в админ панели и на аватарах пользователей
- возможность переключить язык (смотрим i18n локализация)
- использовать friendly_id (https://github.com/norman/friendly_id) для формирования "человеко понятных" URL's.
- по 5 картинок на страничку
- меню(горизонтальное)
   + категории (оно же меню вертикальное или выпадающий список) - отображает 5 самых популярных категорий. Популярными категорими будут те, в которых больше всего изображений, лайков и комментариев.
   + изображения - ссылка на images/index (все изображения, по 20 на страницу, отсортированые по лайкам по убыванию, средний превью размер)
   + все комментарии(отсортированые по дате создания)
- Доступные страницы пользователя:
  - localhost:3000/ - root page, нужна просто красивая страничка со слайдером.
  - localhost:3000/categories - пользователь попадает после аунтентификации или регистрации, где указаны только категории картинок
  - localhost:3000/categories/cars/ - показаны картинки по категории авто
  - localhost:3000/categories/cars/:image_id - показана картинки и есть возможность ставить лайки и коментарий. Пример ссылки - localhost:3000/categories/cars/2
  - localhost:3000/profile - страница профиля юзера. Отображается данные о пользователе с возможностью редактирования.
- nokogiri(для получение изображений). Указываем в форму(отдельное место в админке) URL на страницу и вытягиваем все изображения от туда. 
- Показывать картинки у которых есть категории , другие не отображать только в админке.
- recapcha (google) - отображать, к примеру при 3ех не правильных паролей\логинов при авторизации. Или аналогом при спаме комментариев.
- omniauth логин на любую социалку.
- Отправлять емеилы когда пользователь регистрируется, подписуется на категорию и при добавление нового изображения в подписанной категории.
- gem resque - повесить на бекграудн как минимум отправку емеилов, так же можете еще что-то придумать.

#### Тестирование

Покрыть код тестами с помощью rspec.

Для интеграционных тестов использовать capybara и selenium.
Для юнит и функциональных тестов хватит одного rspec. 
    

## В КОНЦЕ
- рассмотреть pusher (slanger, web_socket, action cable). Придумаете приминение - будет плюсом.
- Задеплоить приложение на heroku.