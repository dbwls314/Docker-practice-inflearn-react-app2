# 운영환경 만들기위한 dockerfile
# builder stage : 빌드파일 생성하는 곳
FROM node:alpine as builder

WORKDIR '/usr/src/app'

COPY package.json .

RUN npm install

COPY ./ ./

RUN npm run build

# run stage
FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
                    # 지금 workdir 파일 위치   # workdir가 사용할수잇는 폴더위치