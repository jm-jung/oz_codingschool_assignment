from flask.views import MethodView
from flask_smorest import Blueprint, abort
from schemas import BookSchema

# 블루프린트 생성: 'items'라는 이름으로, URL 접두사는 '/items'
blp = Blueprint("books", "books", url_prefix="/books", description="Operations on books")

# 간단한 데이터 저장소 역할을 하는 리스트
library = []

# 'ItemList' 클래스 - GET 및 POST 요청을 처리
@blp.route("/")
class books(MethodView):
    @blp.response(200)
    def get(self):
        # 모든 아이템을 반환하는 GET 요청 처리
        return library

    @blp.arguments(BookSchema)
    @blp.response(201, BookSchema)
    def post(self, new_data):
        # 새 아이템을 추가하는 POST 요청 처리
        new_data["id"]=len(library)+1
        library.append(new_data)
        return new_data

# 'Item' 클래스 - GET, PUT, DELETE 요청을 처리
@blp.route("/<int:book_id>")
class Item(MethodView):
    @blp.response(200)
    def get(self,book_id):
        # 특정 ID를 가진 아이템을 반환하는 GET 요청 처리
				# next() => 반복문에서 값이 있으면 값을 반환하고 없으면 None을 반환
				# next는 조건을 만족하는 첫 번째 아이템을 반환하고, 그 이후의 아이템은 무시합니다.
        book = next((book for book in library if book["id"] == book_id), None)
        if book is None:
            abort(404, message="해당 책을 찾을 수 없습니다.")
        return book

    @blp.arguments(BookSchema)
    @blp.response(200, description="라이브러리에 수정사항이 있습니다.")
    def put(self, new_data, book_id):
        # 특정 ID를 가진 아이템을 업데이트하는 PUT 요청 처리
        book = next((book for book in library if book["id"] == book_id), None)
        if book is None:
            abort(404, message="책을 찾을 수 없습니다.")
        book.update(new_data)
        return book

    @blp.response(204, description="책이 삭제되었습니다.")
    def delete(self, book_id):
        # 특정 ID를 가진 아이템을 삭제하는 DELETE 요청 처리
        global library
        if not any(book for book in library if book["id"] == book_id):
            abort(404, message="Item not found")
        library = [book for book in library if book["id"] != book_id]
        return ''