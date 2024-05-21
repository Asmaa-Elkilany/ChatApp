
import 'dart:typed_data';

import 'package:chaaaaaaaaaaaaaaaaaaaaat/features/dashboard/core/extentions/build_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../chats/model/entity_model/users_model.dart';
import '../../contoller/favourite_cubit.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key,
    required this.usersModel,
    required this.controller,
  });
  final UsersModel usersModel;
  final FavoriteCubit controller ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.getTheme.buttonTheme.colorScheme?.background.withOpacity(0.1) ?? Colors.transparent,
          border: Border.all(
            color: context.getTheme.buttonTheme.colorScheme?.background.withOpacity(0.2) ?? Colors.transparent,
            width: 2,
          ),
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


                        /*
                      const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("images/profile.jpg"),
                        )

,
*/

                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.memory(
                            usersModel.image ?? Uint8List(5),
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
                      children: [  InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, 'chat_in');
                        },
                        child: Text(usersModel.username ?? 'Name',
                          style:context.getTheme.textTheme.bodyLarge,
                        ),
                      ),

                      ],
                    ),
                    // this will have the date of the last message
                    const Spacer(),
                     Column(
                      children: [
                       Text( "Date" ,style: context.getTheme.textTheme.bodyLarge,),

                      ],
                    ),

                  ],
                ),
                 const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  InkWell(child: usersModel.favorite ==1?
                  const Icon(CupertinoIcons.heart_fill)
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
                      color: AppColors.mainColor.withOpacity(.7),
                    )

                    ,

                  ],
                )
              ],
            ),

          ),
      ),
    );
  }
}

