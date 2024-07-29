from flask import request,jsonify
from flask_smorest import Blueprint,abort


def create_posts_blueprint(mysql):
    posts_blp=Blueprint('Posts', __name__, description='posts api', url_prefix='/posts')
    @posts_blp.route('/',methods=['GET','POST'])
    def posts():
        cursor=mysql.connection.cursor()
        if request.method=='GET':
            cursor.execute("SELECT * FROM posts")
            posts=cursor.fetchall()
            cursor.close()
            post_list=[]
            for post in posts:
                post_list.append({"id":post[0],"title":post[1],"content":post[2]})

            return jsonify(post_list)
        elif request.method=='POST':
            title=request.json.get('title')
            content=request.json.get('content')

            if not title or not content:
                abort(400,message='title and content are required')
            sql="INSERT INTO posts (title,content) VALUES (%s,%s)"
            cursor.execute(sql,(title,content))
            mysql.connection.commit()
            cursor.close()
            return jsonify({"message":"success"}),201

    @posts_blp.route('/<int:id>',methods=['GET','PUT','DELETE'])
    def post(id):
        cursor=mysql.connection.cursor()
        if request.method=='GET':
            cursor.execute(f"SELECT * FROM posts WHERE id={id}")
            posts=cursor.fetchone()

            if not posts:
                abort(404,message='post not found')
            cursor.close()
            return jsonify({"id":posts[0],"title":posts[1],"content":posts[2]})

        elif request.method=='PUT':
            title=request.json.get('title')
            content=request.json.get('content')
            if not title or not content:
                abort(400,message='title and content are required')

            sql = "SELECT * FROM posts WHERE id=%s"
            cursor.execute(sql, (id,))
            post = cursor.fetchone()

            if not post:
                abort(404,message='post not found')
            sql="UPDATE posts SET title=%s,content=%s WHERE id=%s"
            cursor.execute(sql,(title,content,id))
            mysql.connection.commit()
            cursor.close()
            return jsonify({"message":"success change"}),200

        elif request.method=='DELETE':
            sql = "SELECT * FROM posts WHERE id=%s"
            cursor.execute(sql, (id,))
            post = cursor.fetchone()

            if not post:
                abort(404,message='post not found')
            sql = "DELETE FROM posts WHERE id=%s"
            cursor.execute(sql, (id,))
            mysql.connection.commit()
            cursor.close()
            return jsonify({"message":"success delete"}),200
    return posts_blp








