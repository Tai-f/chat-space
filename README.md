# **DataBase of "chat-space"**
---------------

## **Overview**
design DB of "chat-space"

## **Description**
design **4** tables =>
*users*, *groups*, *group_users* (Intermediate table), *messages*

***~users table~***

|  id  |  name  |  email  |  password  |
|:----:|:------:|:-------:|:----------:|
|      |        |         |            |

has_many :groups, through : :group_users
has_many :group_users
has_many :messages
t.string :name, null:false
add_index :users, [:name, :email]

***~groups table~***

|  id  |  name  |
|:----:|:------:|
|      |        |

has_many :group_users
has_many :messages
has_many :users, through : :group_users
t.string :name, null:false



***~group_users table~***

|  id  |  user_id  |  group_id  |
|:----:|:---------:|:----------:|
|      |           |            |

belongs_to :group
belongs_to :user
t.references :user, foreign_key :true
t.references :group, foreign_key :true


***~messages table~***

|  id  |  body  |  image  |  user_id  |  group_id  |
|:----:|:------:|:-------:|:---------:|:----------:|
|      |        |         |           |            |

belongs_to :group
belongs_to :user
t.references :user, foreign_key :true
t.references :group, foreign_key :true
t.string :body, null:false
