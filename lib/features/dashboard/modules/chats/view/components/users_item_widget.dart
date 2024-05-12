
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contoller/chats_cubit.dart';
import '../../model/entity_model/users_model.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key,
    required this.usersModel,
    required this.controller,
  });
  final UsersModel usersModel;
  final ChatsCubit controller ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: DecoratedBox(decoration: BoxDecoration(
        color:Theme.of(context).primaryColor.withOpacity(.1),
      border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.6)),
        borderRadius: BorderRadius.circular(10),
      ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                       Column(
                      children: [
                  /*    CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("images/profile.jpg"),
                        )
                        usersModel.image== null ? CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("images/profile.jpg"),
                ):*/
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.memory(
                            usersModel.image!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                        ),


                      ],
                    ),
                  //  Image.memory()
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(usersModel.username ?? 'Name',
                          style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),

                      ],
                    ),
                    // this will have the date of the last message
                    const Spacer(),
                    const Column(
                      children: [
                       Text( "Date" ),
                      ],
                    ),

                  ],
                ),
                 Divider(
                  thickness: 1,
                  color:Theme.of(context).primaryColor.withOpacity(.7),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  InkWell(child: usersModel.favorite ==1?
                  Icon(CupertinoIcons.heart_fill, color: Theme.of(context).primaryColor,)
                      :const Icon(CupertinoIcons.heart),
                      onTap :(){
                        if (usersModel.favorite==1){
                          controller.addChatToFavorite(usersModel.id?? 0,0);
                        } else{
                          controller.addChatToFavorite(usersModel.id?? 0,1);
                        }
                      }
                  ),
                    Container(
                      height: 20,
                      width: .5,
                      color: Theme.of(context).primaryColor.withOpacity(.7),
                    )

                    ,
                    InkWell(child: usersModel.favorite ==1?
                    Icon(CupertinoIcons.delete, color: Theme.of(context).primaryColor.withOpacity(.7),)
                        :const Icon(CupertinoIcons.delete),
                        onTap :(){
                          if (usersModel.favorite==1){
                            controller.addChatToFavorite(usersModel.id?? 0,0);
                          } else{
                            controller.addChatToFavorite(usersModel.id?? 0,1);
                          }
                        }
                    ),
                  ],
                )
              ],
            ),

          ),
      ),
    );
  }
}

