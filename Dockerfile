# ---- Base Node ----
FROM node:lts-alpine3.16 AS base
ENV PORT=3000
WORKDIR /usr/service
COPY package.json . 

# ---- Dependencies ----
FROM base AS dependencies
# RUN npm set progress=false && npm config set depth 0 && npm set legacy-peer-deps true
RUN yarn install --only=production 
RUN cp -R node_modules prod_node_modules
# RUN npm install

# ---- Build Webpack -----
FROM dependencies AS build
WORKDIR /usr/build
COPY . .
RUN yarn build

# ---- Release ----
FROM base AS release
# copy production node_modules
COPY --from=dependencies /usr/service/prod_node_modules ./node_modules
# copy app sources
COPY --from=build /usr/build/webpack/dist ./dist


# expose port and define CMD
EXPOSE 3000 
CMD yarn start
