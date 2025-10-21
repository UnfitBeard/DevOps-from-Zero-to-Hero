# base image to create react app image
FROM node:20-alpine

# create user with permissions to run app
# -S system user
# -G add user to group
# run app as non root user...good
RUN addgroup app && adduser -S -G app app

# set user to run app
USER app


# working directory
WORKDIR /app

# copy 
COPY package*.json ./

# sometimes file ownership changed to root
USER root

# change ownership of app directory to app user
RUN chown -R app:app .

# change user back to app user
USER app

# install npm dependecies
RUN npm install

# copy rest of files to workdir
COPY . .

EXPOSE 5173

CMD npm run dev