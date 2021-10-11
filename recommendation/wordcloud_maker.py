from wordcloud import WordCloud
from wordcloud import STOPWORDS

import pandas as pd
import numpy as np
import os, shutil

def make_wordcloud(file_path, save_path, font_path, users_file_name, books_file_name, user_id):
    stopwords = set(STOPWORDS)
    stopwords.add("국내도서")
    df_users = pd.read_csv(file_path + users_file_name, encoding='cp949')
    df_users_like_borrowed_interesttags = pd.DataFrame(df_users, columns=['user_id', 'like', 'borrowed', 'interest_tag'])
    df_users_like_borrowed_interesttags = df_users_like_borrowed_interesttags[df_users_like_borrowed_interesttags['user_id']==user_id]

    str_like = list(np.array(df_users_like_borrowed_interesttags['like'].tolist()))
    i = str_like[0].lstrip('[').rstrip(']')
    i = i.split(', ')
    i = list(map(int, i))
    list_like = i

    df_books = pd.read_csv(file_path + books_file_name, encoding='UTF8')
    df_books_tag = pd.DataFrame(df_books, columns=['categoryName'])
    df_books_tag = df_books_tag.iloc[list_like, :]

    list_books_tag = np.array(df_books_tag.iloc[:, 0].tolist())
    list_books_tag = list(map(lambda x:x.split('>'), list_books_tag))
    list_books_tag = sum(list_books_tag, [])
    str_books_tag = " ".join(list_books_tag)

    wc = WordCloud(font_path=font_path, #"C:/Users/admin/Documents/osam_ai/dev_rec/NanumFontSetup_TTF_BARUNPEN/NanumBarunpenR.ttf",
            background_color="white",
            width=400,
            height=300,
            max_words=50,
            max_font_size=100,
            stopwords=stopwords)

    wc.generate(str_books_tag)
    file_name = 'favoriteCategory_'+str(user_id)+'.png'
    wc.to_file(file_name)

    path = os.getcwd()
    shutil.move(path+"\\"+file_name, save_path+"\\"+file_name)


file_path = 'C:/Users/admin/Documents/osam_ai/book_dataset/'
save_path = file_path
users_file_name = "API_test_users.csv"
books_file_name = "API_test_books.csv"
font_path = "C:/Users/admin/Documents/osam_ai/dev_rec/NanumFontSetup_TTF_BARUNPEN/NanumBarunpenR.ttf"
user_id = 0
make_wordcloud(file_path, save_path, font_path, users_file_name, books_file_name, user_id)