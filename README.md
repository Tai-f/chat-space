# **DataBase of "Chat-Space"**

=====

## **Overview**
create DB of "chat-space"
-----------------------

## **Description**
create **4** tables =>
{ *users*, *groups*, *user_groups* (Intermediate table), *messages*}

***~Users Table~***

|  id  |  name  |  email  |  password  |
|:----:|:------:|:-------:|:----------:|
|      |        |         |            |

has_many :groups, through : :user_groups
has_many :messages
t.string :name, null:false
add_index :users, [:name, :email]

***~Groups Table~***

|  id  |  name  |
|:----:|:------:|
|      |        |

has_many :users, through : :user_groups
has_many :messages
t.string :name, null:false



***~User_Groups Table~***

|  id  |  user_id  |  group_id  |
|:----:|:---------:|:----------:|
|      |           |            |

belongs_to :user
belongs_to :group


***~Messages Table~***

|  id  |  body  |  image  |  user_id  |  group_id  |
|:----:|:------:|:-------:|:---------:|:----------:|
|      |        |         |           |            |

belongs_to :user
belongs_to :group
