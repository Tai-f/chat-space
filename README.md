# **DataBase of "chat-space"**
---------------

## **Overview**
design DB of "chat-space"

## **Description**
design **4** tables =>
*users*, *groups*, *groups_users* (Intermediate table), *messages*

***~users table~***

|  id  |  name  |  email  |  password  |
|:----:|:------:|:-------:|:----------:|
|      |        |         |            |

has_many :groups, through : :groups_users
has_many :groups_users
has_many :messages
t.string :name, null:false
add_index :users, [:name, :email]

***~groups table~***

|  id  |  name  |
|:----:|:------:|
|      |        |

has_many :groups_users
has_many :messages
has_many :users, through : :groups_users
t.string :name, null:false



***~groups_users table~***

|  id  |  user_id  |  group_id  |
|:----:|:---------:|:----------:|
|      |           |            |

belongs_to :group
belongs_to :user


***~messages table~***

|  id  |  body  |  image  |  user_id  |  group_id  |
|:----:|:------:|:-------:|:---------:|:----------:|
|      |        |         |           |            |

belongs_to :group
belongs_to :user
t.string :body, null:false
